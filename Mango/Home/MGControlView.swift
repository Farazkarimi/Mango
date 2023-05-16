import SwiftUI
import NetworkExtension

struct MGControlView: View {
    
    @EnvironmentObject private var packetTunnelManager: MGPacketTunnelManager
    
    var body: some View {
        LabeledContent {
            if let status = packetTunnelManager.status {
                switch status {
                case .connected, .disconnected:
                    Button {
                        onTap(status: status)
                    } label: {
                        Text(status.buttonTitle)
                    }
                    .disabled(status == .invalid)
                default:
                    ProgressView()
                }
            } else {
                Button  {
                    Task(priority: .high) {
                        do {
                            try await packetTunnelManager.saveToPreferences()
                        } catch {
                            debugPrint(error.localizedDescription)
                        }
                    }
                } label: {
                    Text(Localized.install)
                }
            }
        } label: {
            Label {
                Text(packetTunnelManager.status.flatMap({ $0.displayString }) ?? Localized.vpnNotInstalled)
            } icon: {
                Image(systemName: "link")
            }
        }
    }
    
    private func onTap(status: NEVPNStatus) {
        Task(priority: .high) {
            do {
                switch status {
                case .connected:
                    packetTunnelManager.stop()
                case .disconnected:
                    try await packetTunnelManager.start()
                default:
                    break
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}

extension NEVPNStatus {
    
    var buttonTitle: String {
        switch self {
        case .invalid, .disconnected:
            return Localized.connect
        case .connected:
            return Localized.disconnect
        case .connecting, .reasserting, .disconnecting:
            return ""
        @unknown default:
            return Localized.unknown
        }
    }
    
    var displayString: String {
        switch self {
        case .invalid:
            return Localized.unavailable
        case .disconnected:
            return Localized.notConnected
        case .connecting:
            return "\(Localized.connecting)..."
        case .connected:
            return Localized.connected
        case .reasserting:
            return "\(Localized.reconnecting)..."
        case .disconnecting:
            return "\(Localized.disconnecting)..."
        @unknown default:
            return Localized.unknown
        }
    }
}
