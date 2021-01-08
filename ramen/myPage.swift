//
//  ViewController.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/5.
//

import UIKit

struct user: Decodable{
   var phonenumber: String
   var user_id: Int
   var good_count: Int
   var point: Int
   var user_name: String
}



public var user_name = "test"


class mainpagecontroller: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    var selfreviewlist = ["書いたレビュー","2021/1/4       一蘭","2021/1/7       麺屋武蔵"]
    var didSelectName = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selfreviewlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.text = self.selfreviewlist[indexPath.row]
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectName = selfreviewlist[indexPath.row]
        self.performSegue(withIdentifier: "mainToDetailSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as? reviewController
        nextController?.temp_author = self.didSelectName
    }
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pointlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var reviewstable: UITableView!

    @IBAction func testbutton(_ sender: Any){}
    
    
    func json(){

        let jsonUrlString = "https://72s1bv5qp2.execute-api.ap-northeast-1.amazonaws.com/demo"
            guard let url = URL(string: jsonUrlString) else {return}
            //
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else {return}
                print(data)


                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) // JSONの読み込み
                    let userinfo = json as! NSArray // トップレベルが配列
                    for roop in userinfo {
                        let next = roop as! NSDictionary
                        let user_phonenumber = next["phone_number"] as! String
                        let tempname = next["user_name"] as! String
                        user_name = tempname
                        print(tempname)
                        print(user_phonenumber)
                    }
                } catch {
                    print(error) // パースに失敗したときにエラーを表示
                }

            }.resume()
    }
    
    
    override func viewDidLoad() {

        //let namelabel = UILabel(frame: CGRect(x: 30, y: 100, width: 200, height: 40))
        
        //self.view.addSubview(namelabel)
        reviewstable.dataSource = self
        reviewstable.delegate = self
        reviewstable.estimatedRowHeight = 50
        reviewstable.rowHeight = 70
        
        super.viewDidLoad()
        //json()
        namelabel.text = user_name
        
        
        
        // Do any additional setup after loading the view.
        

       
    }
    
    
    
}

