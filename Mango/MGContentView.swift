import SwiftUI

struct MGContentView: View {
    
    @StateObject private var packetTunnelManager        = MGPacketTunnelManager()
    @StateObject private var configurationListManager   = MGConfigurationListManager()
    
    @AppStorage(MGConfiguration.currentStoreKey, store: .shared) private var current: String = ""
    
    var body: some View {
        TabView {
            MGHomeView(current: $current)
                .tabItem {
                    Text(Localized.dashBoard)
                    Image(systemName: "text.and.command.macwindow")
                }
            MGConfigurationListView(current: $current)
                .tabItem {
                    Text(Localized.configurationManagement)
                    Image(systemName: "doc")
                }
            MGSettingsView()
                .tabItem {
                    Text(Localized.setup)
                    Image(systemName: "gearshape")
                }
        }
        .environmentObject(packetTunnelManager)
        .environmentObject(configurationListManager)
    }
}
