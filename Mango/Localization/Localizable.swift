//
//  Localizable.swift
//  Mango
//
//  Created by Faraz on 5/14/23.
//

import Foundation

fileprivate func LocalizedFormat(_ key: String, args: CVarArg...) -> String {
    let localize = NSLocalizedString(key, comment: "").replacingOccurrences(of: "%s", with: "%@")
    return String(format: localize, args)
}

enum Localized {
    static let dashBoard = NSLocalizedString("dash_board", comment: "")
    static let configurationManagement = NSLocalizedString("configuration_management", comment: "")
    static let setup = NSLocalizedString("setup", comment: "")
    static let protocolParseFaild = NSLocalizedString("protocol_parse_faild", comment: "")
    static let notSupported = NSLocalizedString("not_supported", comment: "")
    static let protocolAnalysis = NSLocalizedString("protocol_analysis", comment: "")
    static let configNotExist = NSLocalizedString("config_not_exist", comment: "")
    static let configParseFaild = NSLocalizedString("config_parse_faild", comment: "")
    static let userNotExist = NSLocalizedString("user_not_exist", comment: "")
    static let serverDomainNotExist = NSLocalizedString("server_domain_not_exist", comment: "")
    static let portNumberInvalid = NSLocalizedString("port_number_invalid", comment: "")
    static let unknownTransport = NSLocalizedString("unknown_transport", comment: "")
    //Home
    static let state = NSLocalizedString("state", comment: "")
    static let currentConfig = NSLocalizedString("current_config", comment: "")
    static let dashboard = NSLocalizedString("dashboard", comment: "")
    static let vpnNotInstalled = NSLocalizedString("vpn_not_installed", comment: "")
    static let install = NSLocalizedString("Install", comment: "")
    static let connect = NSLocalizedString("connect", comment: "")
    static let disconnect = NSLocalizedString("disconnect", comment: "")
    static let unknown = NSLocalizedString("unknown", comment: "")
    static let unavailable = NSLocalizedString("unavailable", comment: "")
    static let notConnected = NSLocalizedString("not connected", comment: "")
    static let connecting = NSLocalizedString("connecting", comment: "")
    static let connected = NSLocalizedString("connected", comment: "")
    static let reconnecting = NSLocalizedString("reconnecting", comment: "")
    static let disconnecting = NSLocalizedString("disconnecting", comment: "")
    static let connectionDuration = NSLocalizedString("connection_duration", comment: "")
    static let name = NSLocalizedString("name", comment: "")
    static let type = NSLocalizedString("type", comment: "")
    static let recentlyUpdated = NSLocalizedString("recently_updated", comment: "")
    static let noCurrentConfig = NSLocalizedString("no_current_config", comment: "")
    static let none = NSLocalizedString("none", comment: "")
    static let notSelected = NSLocalizedString("not selected", comment: "")
}
