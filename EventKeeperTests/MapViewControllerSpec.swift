//
//  MapViewControllerSpec.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/26/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick
import MapKit
@testable import EventKeeper

class MapViewControllerSpec: QuickSpec {
    override func spec() {
        describe("MapViewController") {
            beforeEach() {
            }
            it("has a MapView") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.mapView).toNot(beNil())
            }
            it("has Coordinates text fields") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.latitudeField).toNot(beNil())
                expect(sut.longitudeField).toNot(beNil())
            }
            
            it("has Go! and Save buttons") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.goButton).toNot(beNil())
                expect(sut.saveButton).toNot(beNil())
            }
        }
    }
}
