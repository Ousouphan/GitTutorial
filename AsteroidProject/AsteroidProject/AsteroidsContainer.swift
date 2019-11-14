//
//  AsteroidsContainer.swift
//  AsteroidProject
//
//  Created by mcs on 11/14/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct AsteroidsContainer: Codable {
  let asteroidNearEarthContainer: AsteroidsNearUsContainer
  
  enum CodingKeys: String, CodingKey {
  case asteroidNearEarthContainer = "near_earth_objects"
  }
}
  
  struct AsteroidsNearUsContainer: Codable {
    let startDate: [AsteroidInfo]
    
    enum CodingKeys: String, CodingKey {
      case startDate = "2019-09-07"
    }
  }
  
struct AsteroidInfo: Codable {
  let id: String
  let name: String
  let absoluteMagnitude: Double
  let estimatedDiameter: DiameterMeasurements
  let isHazardous: Bool
  let approachData: [CloseApproachData]
  
  enum CodingKeys: String, CodingKey {
    case absoluteMagnitude = "absolute_magnitude_h"
    case estimatedDiameter = "estimated_diameter"
    case isHazardous = "is_potentially_hazardous_asteroid"
    case approachData = "close_approach_data"
  }
}

struct DiameterMeasurements: Codable {
  let kilometers: Kilometers
}

struct Kilometers: Codable {
  let estimatedDiameterMin: Double
  let estimatedDiameterMax: Double
  
  enum CodingKeys: String, CodingKey {
    case estimatedDiameterMin = "estimated_diameter_min"
    case estimatedDiameterMax = "estimated_diameter_max"
  }
}

struct CloseApproachData: Codable {
  let closeApproachDateFull: String
  let relativeVelocity: RelativeVelocity
  let missDistance: MissDistance
  let orbitingBody: String
  
  enum CodingKeys: String, CodingKey {
    case closeApproachDateFull = "close_approach_date"
    case relativeVelocity = "relative_velocity"
    case missDistance = "miss_distance"
    case orbitingBody = "orbiting_body"
  }
}

struct RelativeVelocity: Codable {
  let kilometersPerSecond: String
  let kilometersPerHour: String
  let milesPerHour: String
  
  enum CodingKeys: String, CodingKey {
    case kilometersPerSecond = "kilometers_per_second"
    case kilometersPerHour = "kilometers_per_hour"
    case milesPerHour = "miles_per_hour"
  }
}

struct MissDistance: Codable {
  let kilometers: String
  let miles: String
}
