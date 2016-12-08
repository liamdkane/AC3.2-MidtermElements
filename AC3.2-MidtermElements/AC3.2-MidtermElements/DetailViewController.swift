//
//  DetailViewController.swift
//  AC3.2-MidtermElements
//
//  Created by C4Q on 12/8/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    var element: Element?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.element!.name
        if let e = element {
            atomicNumberLabel.text = String(e.number)
            weightLabel.text = String(e.weight)
            nameLabel.text = e.name
            symbolLabel.text = e.symbol
            descriptionLabel.text = "Boiling Point: \(e.boiling?.description ?? "N/A")\nMelting Point: \(e.melting?.description ?? "N/A")\nYear Discovered: \(e.yearDiscovered)\nElectrons: \(e.electrons?.description ?? "N/A")\nDensity: \(e.density?.description ?? "N/A")\nCrust Percent: \(e.crustPercent?.description ?? "N/A")\n Ion Energy: \(e.ionEnergy?.description ?? "N/A")"
            APIRequestManager.manager.getData(endPoint: "https://s3.amazonaws.com/ac3.2-elements/\(e.symbol).png") { (data: Data?) in
                if let d = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: d)
                        self.imageView.alpha = 0.25
                    }
                }
            }
        }
    }
}
