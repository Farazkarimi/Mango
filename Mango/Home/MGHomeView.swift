import SwiftUI

struct MGHomeView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var packetTunnelManager: MGPacketTunnelManager
    
    let current: Binding<String>
    
    var body: some View {
        NavigationStack {
            Group {
                if packetTunnelManager.isProcessing {
                    ZStack {
                        LoadingBackgroundColor()
                        ProgressView()
                            .controlSize(.large)
                    }
                    .ignoresSafeArea()
                } else {
                    Form {
                        Section {
                            MGControlView()
                            MGConnectedDurationView()
                        } header: {
                            Text(Localized.state)
                        }
                        Section {
                            MGConfigurationView(current: current)
                        } header: {
                            Text(Localized.currentConfig)
                        }
                    }
                    .environmentObject(packetTunnelManager)
                }
            }
            .navigationTitle(Text(Localized.dashboard))
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private func LoadingBackgroundColor() -> Color {
        switch colorScheme {
        case .light:
            return Color(uiColor: .systemGroupedBackground)
        default:
            return Color.clear
        }
    }
}
