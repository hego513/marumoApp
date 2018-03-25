//
//  ViewController.swift
//  marumoFirstApp
//
//  Created by MINAGI on 2018/03/24.
//  Copyright © 2018年 MINAGI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //   outputLabel.text = "sumple" ;
        let placeImage = UIImage(named: "IMG_3425.jpg");
        marumoImage.image=placeImage;
        let URLString = "http://localhost:3000/place";
        let JSONURL = URL(string: URLString);
        
//        var request = URLRequest(url : JSONURL!);
//        request.httpMethod = "GET"
//        let config = URLSessionConfiguration.default;
//
//        let listUrl = "https://xxxxxxxxx.com/?aaa=bbb"
        
//        guard let url = URL(string: listUrl) else { return }

        print("test")
        var value : String = ""
     //   print(value)
        // サブスレッドで実行
        DispatchQueue.global(qos: .default).async {
            // サブスレッド(バックグラウンド)で実行する方を書く
        URLSession.shared.dataTask(with: JSONURL!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            if response != nil {
                print(response)
            }
                print("test")
            guard let data = data  else {
            return
            }
            
            let json  = try? JSONDecoder().decode(Place.self, from: data)
            
            value = json!.name

            }.resume()
            DispatchQueue.main.async {
                // Main Threadで実行する
                
                self.outputLabel.text = value
            }
        
        }
        
        
//        outputLabel.text = json!.name
        
        
//        let session = URLSession(configuration: config);
//        DispatchQueue.global(qos: .userInitiated).async {
//            [unowned self] in
//            let task = session.dataTask(with: request, completionHandler: {(data,request,error) in
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any];
//               print(json)
//                }catch{
//                    print("error")
//                }
//            })
//            task.resume()
//
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func printOutputLabel(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var marumoImage: UIImageView!
}

