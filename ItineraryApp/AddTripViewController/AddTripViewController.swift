//
//  AddTripTableViewController.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/7/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import Photos


class AddTripViewController: UIViewController {
    @IBOutlet weak var popupView: PopUIView!
    @IBOutlet weak var addTripLabel: UILabel!
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var save: UIButton!
    
    var doneSaving:(()->())?
    var tripIndexEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTripLabel.font = UIFont(name: Theme.mainFontName, size: 32.0)
        backgroundImage.layer.cornerRadius = 10
        
        addTripLabel.layer.shadowOpacity = 1
        addTripLabel.layer.shadowColor = UIColor.white.cgColor
        addTripLabel.layer.shadowOffset = CGSize.zero
        addTripLabel.layer.shadowRadius = 5
        
        if let index = tripIndexEdit {
            let trip = Data.tripModels[index]
            addTripLabel.text = trip.title
            backgroundImage.image =  trip.image
        }
        
    }
    
    func presentPicker(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    @IBAction func addBackgroundImage(_ sender: UIButton) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    self.presentPicker()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPicker()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted.", message: "Photo library is restricted and cannot be accessed.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library denied.", message: "Photo library is previously denied. Please update your settings if you want to change this", preferredStyle: .alert)
                    let SettingsAtion = UIAlertAction(title: "Go to Settings", style: .default)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default)
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplicationOpenSettingsURLString)!
                        UIApplication.shared.open(url, options: [:])
                    }
                    alert.addAction(SettingsAtion)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                }
                
            })
        }
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        guard textField.text != "", let newtripName = textField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
            imageView.image = #imageLiteral(resourceName: "warning")
            imageView.contentMode = .scaleAspectFit
            textField.rightViewMode = .always
            textField.rightView = imageView
            return
        }
        if let index = tripIndexEdit {
            TripFunctions.updateTrip(at: index, title: newtripName, image:  backgroundImage.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title:newtripName, image: backgroundImage.image))
        }
        if let doneSaving =  doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if  let  editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.backgroundImage.image = editedImage
        } else if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.backgroundImage.image = selectedImage
        }
        dismiss(animated: true)
        
    }
}































