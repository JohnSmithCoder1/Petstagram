//
//  TakePhotoViewController.swift
//  Petstagram
//
//  Created by J S on 8/14/21.
//

import UIKit

class TakePhotoViewController: UIViewController {
//    @IBOutlet var previewView: CameraPrviewView!
//
//    var captureController: PhotoCaptureController!
    let completionHandler: (UIImage) -> Void
    
    init?(coder: NSCoder, completionHandler: @escaping (UIImage) -> Void) {
        self.completionHandler = completionHandler
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        captureController = PhotoCaptureController(preview: previewView, alertPresenter: self, captureCompletionHandler: completionHandler)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        captureController.startSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        captureController.stopSession()
    }
    
    @IBAction func shutterButtonTapped() {
//        captureController.capturePhoto()
    }
}
