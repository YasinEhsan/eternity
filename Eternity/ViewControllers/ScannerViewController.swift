//
//  ScannerViewController.swift
//  Eternity
//
//  Created by Kevin Chen on 3/17/2019.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ScannerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    var lst:[String] = []
    var foods:[String] = ["icecream", "banana", "pizza, pizza pie", "orange", "burger", "cheeseburger", "hotdog", "broccoli", "pineapple", "meatloaf", "meat cleaver", ""]
    
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //let btn:UIButton;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here is where we start up the camera
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        
        //        VNImageRequestHandler(cgImage: <#T##CGImage#>, options: [:]).perform(<#T##requests: [VNRequest]##[VNRequest]#>)
        
        setupIdentifierConfidenceLabel()
        
        let button = UIButton(frame: CGRect(x: 150, y: 620, width: 150, height: 40))
        button.backgroundColor = .green
        button.setTitle("Finish", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(){
        self.performSegue(withIdentifier: "foodVC", sender: self)
        print("HEYYYYYYYYY")
    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //        print("Camera was able to capture a frame:", Date())
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // !!!Important
        // make sure to go download the models at https://developer.apple.com/machine-learning/ scroll to the bottom
        guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            //perhaps check the err
            
            //            print(finishedReq.results)
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            // print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                print(firstObservation.identifier)
                print(self.lst)
                if self.foods.contains("\(firstObservation.identifier)"){
                    if !self.lst.contains("\(firstObservation.identifier)"){
                        self.lst.append("\(firstObservation.identifier)")
                    }
                    self.identifierLabel.text = "\(firstObservation.identifier)"
                }
                else {
                    self.identifierLabel.text = ""
                }
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the selected object to the new view controller.
        let foodViewController = segue.destination as! FoodViewController
        foodViewController.foodLst = self.lst
        
    }

}
