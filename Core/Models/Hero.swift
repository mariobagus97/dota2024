//
//  Hero.swift
//  boilerplate mvvm
//


import Foundation

typealias Heroes = [Hero]

// MARK: - Hero
class Hero: Codable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: PrimaryAttr
    let attackType: AttackType
    let roles: [String]
    let img, icon: String
    let baseHealth: Int
    let baseHealthRegen: Double?
    let baseMana: Int
    let baseManaRegen, baseArmor: Double
    let baseMr, baseAttackMin, baseAttackMax, baseStr: Int
    let baseAgi, baseInt: Int
    let strGain, agiGain, intGain: Double
    let attackRange, projectileSpeed: Int
    let attackRate: Double
    let moveSpeed: Int
    let cmEnabled: Bool
    let legs, proBan, proWin: Int
    let proPick, the1_Pick, the1_Win, the2_Pick: Int
    let the2_Win, the3_Pick, the3_Win, the4_Pick: Int
    let the4_Win, the5_Pick, the5_Win, the6_Pick: Int
    let the6_Win, the7_Pick, the7_Win, the8_Pick: Int
    let the8_Win: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMr = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case strGain = "str_gain"
        case agiGain = "agi_gain"
        case intGain = "int_gain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
        case cmEnabled = "cm_enabled"
        case legs
        case proBan = "pro_ban"
        case proWin = "pro_win"
        case proPick = "pro_pick"
        case the1_Pick = "1_pick"
        case the1_Win = "1_win"
        case the2_Pick = "2_pick"
        case the2_Win = "2_win"
        case the3_Pick = "3_pick"
        case the3_Win = "3_win"
        case the4_Pick = "4_pick"
        case the4_Win = "4_win"
        case the5_Pick = "5_pick"
        case the5_Win = "5_win"
        case the6_Pick = "6_pick"
        case the6_Win = "6_win"
        case the7_Pick = "7_pick"
        case the7_Win = "7_win"
        case the8_Pick = "8_pick"
        case the8_Win = "8_win"
    }
    
    init(id: Int, name: String, localizedName: String, primaryAttr: PrimaryAttr, attackType: AttackType, roles: [String], img: String, icon: String, baseHealth: Int, baseHealthRegen: Double?, baseMana: Int, baseManaRegen: Double, baseArmor: Double, baseMr: Int, baseAttackMin: Int, baseAttackMax: Int, baseStr: Int, baseAgi: Int, baseInt: Int, strGain: Double, agiGain: Double, intGain: Double, attackRange: Int, projectileSpeed: Int, attackRate: Double, moveSpeed: Int, cmEnabled: Bool, legs: Int, proBan: Int, proWin: Int, proPick: Int, the1_Pick: Int, the1_Win: Int, the2_Pick: Int, the2_Win: Int, the3_Pick: Int, the3_Win: Int, the4_Pick: Int, the4_Win: Int, the5_Pick: Int, the5_Win: Int, the6_Pick: Int, the6_Win: Int, the7_Pick: Int, the7_Win: Int, the8_Pick: Int, the8_Win: Int ) {
        self.id = id
        self.name = name
        self.localizedName = localizedName
        self.primaryAttr = primaryAttr
        self.attackType = attackType
        self.roles = roles
        self.img = img
        self.icon = icon
        self.baseHealth = baseHealth
        self.baseHealthRegen = baseHealthRegen
        self.baseMana = baseMana
        self.baseManaRegen = baseManaRegen
        self.baseArmor = baseArmor
        self.baseMr = baseMr
        self.baseAttackMin = baseAttackMin
        self.baseAttackMax = baseAttackMax
        self.baseStr = baseStr
        self.baseAgi = baseAgi
        self.baseInt = baseInt
        self.strGain = strGain
        self.agiGain = agiGain
        self.intGain = intGain
        self.attackRange = attackRange
        self.projectileSpeed = projectileSpeed
        self.attackRate = attackRate
        self.moveSpeed = moveSpeed
        self.cmEnabled = cmEnabled
        self.legs = legs
        self.proBan = proBan
        self.proWin = proWin
        self.proPick = proPick
        self.the1_Pick = the1_Pick
        self.the1_Win = the1_Win
        self.the2_Pick = the2_Pick
        self.the2_Win = the2_Win
        self.the3_Pick = the3_Pick
        self.the3_Win = the3_Win
        self.the4_Pick = the4_Pick
        self.the4_Win = the4_Win
        self.the5_Pick = the5_Pick
        self.the5_Win = the5_Win
        self.the6_Pick = the6_Pick
        self.the6_Win = the6_Win
        self.the7_Pick = the7_Pick
        self.the7_Win = the7_Win
        self.the8_Pick = the8_Pick
        self.the8_Win = the8_Win
    }
}

enum AttackType: String, Codable {
    case melee = "Melee"
    case ranged = "Ranged"
}

enum PrimaryAttr: String, Codable {
    case agi = "agi"
    case all = "all"
    case int = "int"
    case str = "str"
    
}
