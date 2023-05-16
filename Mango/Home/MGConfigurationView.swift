import SwiftUI

struct MGConfigurationView: View {
    
    @EnvironmentObject private var packetTunnelManager: MGPacketTunnelManager
    
    @EnvironmentObject private var configurationListManager: MGConfigurationListManager
    
    let current: Binding<String>
    
    var body: some View {
        Group {
            if let configuration = configurationListManager.configurations.first(where: { $0.id == current.wrappedValue }) {
                LabeledContent(Localized.name, value: configuration.attributes.alias)
                LabeledContent(Localized.type, value: configuration.typeString)
                LabeledContent(Localized.recentlyUpdated) {
                    TimelineView(.periodic(from: Date(), by: 1)) { _ in
                        Text(configuration.attributes.leastUpdated.formatted(.relative(presentation: .numeric)))
                            .font(.callout)
                            .fontWeight(.light)
                    }
                }
            } else {
                NoCurrentConfigurationView()
            }
        }
        .onAppear {
            configurationListManager.reload()
        }
    }
    
    @ViewBuilder
    private func NoCurrentConfigurationView() -> some View {
        HStack {
            Spacer()
            VStack(spacing: 20) {
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.largeTitle)
                Text(Localized.noCurrentConfig)
            }
            .foregroundColor(.secondary)
            .padding()
            Spacer()
        }
    }
    
    private var currentConfigurationName: String {
        guard let configuration = configurationListManager.configurations.first(where: { $0.id == current.wrappedValue }) else {
            return configurationListManager.configurations.isEmpty ? Localized.none : Localized.notSelected
        }
        return configuration.attributes.alias
    }
}
