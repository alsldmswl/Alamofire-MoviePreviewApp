//
//  ViewController.swift
//  alamo_test
//
//  Created by eun-ji on 2023/03/05.
//

import UIKit
import Alamofire


struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
    
}

struct MovieResult: Codable { // result 안에 있는 필요한 데이터 선언(trackName, previewUrl, artworkUrl100)
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case releaseDate
    }
}



class ViewController: UIViewController {
    
    var term = ""
    var movieModel: MovieModel?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        requestAPI()
 
    }
    func loadImage(_ url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {return}
        let request = AF.request(url, method: .get)
        request.responseData{ response in
            switch response.result {
            case .success(let imageData):
                    completion(UIImage(data: imageData))
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func requestAPI() {
        
        let url = "https://itunes.apple.com/search"
        let param = ["term" : term, "media" : "movie"]
        let imgUrl =
        
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON {response in
                print(response)
                switch response.result {
                case .success(let res):
                    do {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                        self.movieModel = try JSONDecoder().decode(MovieModel.self, from: jsonData)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    } catch(let error) {
                        print("error: ", error)
                    }
                case .failure(let res):
                    print(res)
            }
        }
    }
}
 


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! testCell
        cell.titleLabel.text = movieModel?.results[indexPath.row].trackName
       
       
        if let hasURL = self.movieModel?.results[indexPath.row].image {
            self.loadImage(hasURL) { image in
                DispatchQueue.main.async {
                    cell.movieImg.image = image
                }
            }
        }
        
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate
        {
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString){
                
                let myFomatter = DateFormatter()
                myFomatter.dateFormat = "yyyy-MM-dd"
                let dateString = myFomatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
                
            }
               
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(identifier: "Detail") as! Detail
        tableView.deselectRow(at: indexPath, animated: true)
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        self.present(detailVC, animated: true)
    }
  
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        term = hasText
        requestAPI()
        self.view.endEditing(true)
    }
}

