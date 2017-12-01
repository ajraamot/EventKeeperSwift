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

            // TODO: Figure out how to test - this blows up if I try
//            it("has toggle to switch between views") {
//                let storyboard = UIStoryboard(name: "Main",
//                                              bundle: nil)
//                let sut = storyboard
//                    .instantiateViewController(
//                        withIdentifier: "MapViewController")
//                    as! MapViewController
//                _ = sut.view
//                expect(sut.view.subviews).to(contain(AnyClass(UISegmentedControl)))
//            }

            
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
            
            it("has Annotation text fields") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.annotationField).toNot(beNil())
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
            
            // TODO: Figure out why this fails
//            it("goButton_click - moves map to valid coordinates") {
//                let storyboard = UIStoryboard(name: "Main",
//                                              bundle: nil)
//                let sut = storyboard
//                    .instantiateViewController(
//                        withIdentifier: "MapViewController")
//                    as! MapViewController
//                _ = sut.view
//                sut.latitudeField.text = "40"
//                sut.longitudeField.text = "105.28"
//                sut.goButton.sendActions(for: UIControlEvents.touchUpInside)
//                expect(sut.mapView.centerCoordinate.latitude).toEventually(equal(40))
//                expect(sut.mapView.centerCoordinate.longitude).toEventually(equal(-105.28))
//                
//            }

            it("goButton_click - puts a pin annotation at specified coordinates") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                sut.latitudeField.text = "40"
                sut.longitudeField.text = "105.28"
                let initialCount = sut.mapView.annotations.count
                sut.goButton.sendActions(for: UIControlEvents.touchUpInside)
                expect(sut.mapView.annotations.count).to(equal(initialCount + 1))
                
                let annotationList = sut.mapView.annotations
                var latitudeList: [Double] = []
                var longitudeList: [Double] = []
                for annotation in annotationList {
                    latitudeList.append(annotation.coordinate.latitude)
                    longitudeList.append(annotation.coordinate.longitude)
                }
                expect(latitudeList).to(contain(40.0))
                expect(longitudeList).to(contain(105.28))
            }
            
            it("goButton_click - add a label to the annotation pin") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                sut.latitudeField.text = "40"
                sut.longitudeField.text = "105.28"
                sut.annotationField.text = "Chautauqua Park"
                sut.goButton.sendActions(for: UIControlEvents.touchUpInside)
                let annotationList = sut.mapView.annotations
                var labelList: [String] = []
                for annotation in annotationList {
                    labelList.append(annotation.title!!)
                }
                expect(labelList).to(contain("Chautauqua Park"))
            }
            
            it("has Address text field") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.addressField).toNot(beNil())
            }

            it("has Address search button") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                expect(sut.searchButton).toNot(beNil())
            }
            
            it("searchAddress - populates coordinates fields with returned coordinates") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "MapViewController")
                    as! MapViewController
                _ = sut.view
                sut.addressField.text = "222 W Merchandise Mart Plaza, Chicago, IL 60654"
                sut.searchButton.sendActions(for: UIControlEvents.touchUpInside)
                
                sut.searchButton.sendActions(for: UIControlEvents.touchUpInside)
                expect(sut.latitudeField.text).toEventually(equal("41.8885968"))
                expect(sut.longitudeField.text).toEventually(equal("-87.6354407"))
            }
        }
    }
}
