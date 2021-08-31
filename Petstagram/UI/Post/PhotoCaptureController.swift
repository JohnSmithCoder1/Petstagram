//
//  PhotoCaptureController.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import UIKit
import AVFoundation

class PhotoCaptureController: NSObject {
    private var previewView: CameraPreviewView
    private var alertPresenter: UIViewController
    private let session = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "AVCaptureSession queue")
    private var accessGranted = false
    private let photoOutput = AVCapturePhotoOutput()
    private var outputImage: UIImage?
    private let captureCompletionHandler: (UIImage) -> Void
    
    // MARK: - Public methods
    init(previewView: CameraPreviewView, alertPresenter: UIViewController, captureCompletionHandler: @escaping (UIImage) -> Void) {
        self.previewView = previewView
        self.alertPresenter = alertPresenter
        self.captureCompletionHandler = captureCompletionHandler
        super.init()
        
        self.previewView.session = session
        setupSession()
    }
    
    func startSession() {
        sessionQueue.async {
            self.session.startRunning()
        }
    }
    
    func stopSession() {
        sessionQueue.async {
            self.session.stopRunning()
        }
    }
    
    func capturePhoto() {
        sessionQueue.async {
            let photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
            self.photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
    
    // MARK: - Private methods
    
    private enum ConfigurationError: Error {
        case inputConfigurationError
        case outputConfigurationError
    }
    private func setupSession() {
        requestAccess()
        configureSession()
    }
    
    private func requestAccess() {
        sessionQueue.suspend()

        AVCaptureDevice.requestAccess(for: .video) { granted in
            defer {
                self.sessionQueue.resume()
            }

            self.accessGranted = granted

            if granted == false {
                self.alertNoAccess()
            }
        }
    }
    
    private func configureSession() {
        sessionQueue.async {
            guard self.accessGranted else { return }
            
            self.session.beginConfiguration()
            
            defer {
                self.session.commitConfiguration()
            }
            
            do {
                try self.configureInput()
                try self.configureOutput()
            } catch {
                self.alertConfigurationError()
                
                return
            }
        }
    }
    
    private func configureInput() throws {
        self.session.sessionPreset = .photo

        // Use the more specific version of this method to request a different camera (i.e. front camera or telephoto camera)
        guard let cameraDevice = AVCaptureDevice.default(for: .video) else {
            throw ConfigurationError.inputConfigurationError
        }

        let input = try AVCaptureDeviceInput(device: cameraDevice)

        if self.session.canAddInput(input) {
            self.session.addInput(input)
        } else {
            throw ConfigurationError.inputConfigurationError
        }
    }
    
    private func configureOutput() throws {
        if self.session.canAddOutput(self.photoOutput) {
            self.session.addOutput(self.photoOutput)

            // We're taking simple pictures, without depth, live photos, etc.
            self.photoOutput.isHighResolutionCaptureEnabled = false
            self.photoOutput.isLivePhotoCaptureEnabled = false
            self.photoOutput.isDepthDataDeliveryEnabled = false
            self.photoOutput.isPortraitEffectsMatteDeliveryEnabled = false
        } else {
            throw ConfigurationError.outputConfigurationError
        }
    }
    
    private func alertNoAccess() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "No permission", message: "Without access to the camera, Petstagram cannot take photos. Please check privacy settings.", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: { _ in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            })
            
            alert.addAction(closeAction)
            alert.addAction(settingsAction)
            self.alertPresenter.present(alert, animated: true, completion: nil)
        }
    }
    
    private func alertConfigurationError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Uh oh", message: "Something went wrong setting up photo capture", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(closeAction)
            self.alertPresenter.present(alert, animated: true, completion: nil)
        }
    }
}

extension PhotoCaptureController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error processing photo: \(error)")
        } else {
            if let photoData = photo.fileDataRepresentation(), let rawImage = UIImage(data: photoData) {
                outputImage = rawImage.fixedOrientation()
            } else {
                outputImage = nil
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error)")
            
            return
        }
        
        guard let outputImage = outputImage else {
            print("No data found capturing photo")
            
            return
        }
        
        captureCompletionHandler(outputImage)
    }
}
