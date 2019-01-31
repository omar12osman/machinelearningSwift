//
//  ViewController.swift
//  machinelearningSwift
//
//  Created by Majid Osman on 2019-01-30.
//  Copyright © 2019 Majid Osman. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

 
     let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        guard  let CaptureDevice = AVCaptureDevice.default(for: .video) else {return}
        guard let Input = try? AVCaptureDeviceInput(device: CaptureDevice) else {return}
        captureSession.addInput(Input)
    captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "Videoqueue"))
        
//        let requests = VNCoreMLRequest(model: <#T##VNCoreMLModel#>, completionHandler: <#T##VNRequestCompletionHandler?##VNRequestCompletionHandler?##(VNRequest, Error?) -> Void#>)
//        VNImageRequestHandler(cgImage: <#T##CGImage#>, options: [:]).perform(<#T##requests: [VNRequest]##[VNRequest]#>)
}
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("camera was able to to capture a frame", Data())
    }

}

