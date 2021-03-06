//
//  ViewController.swift
//  Movie-List-Without-Storyboard
//
//  Created by iOS on 1/6/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var safeArea: UILayoutGuide!
    
    // table view data source
    var movieInfoList = [Result]()
        
    // The restManager handle all of the network action
    var restManager = RestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "MoveTableView"
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        setupTableView()
        loadMovieInfo()
    }
    
    // MARK: Private methods
    func setupTableView() {
        view.addSubview(tableView)
    
        tableView.dataSource = self
    
        tableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.reuseIdentifier)
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    /// get the movie info as data-sourse of movie `tableview`.
    func loadMovieInfo() {
        guard let url = URL(string: Api.movie) else { return }
        
        restManager.makeRequest(toURL: url, withHttpMethod: .get) { result in
            if result.error != nil {
                print(" Got error with \(String(describing: result.error))")
                return
            }
        
            if let data = result.data {
                let decoder = JSONDecoder()
                if let moviesResult = try? decoder.decode(MoviesResult.self, from: data) {
                    self.movieInfoList = moviesResult.results
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

}

//MARK: - Table view data source.
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.reuseIdentifier, for: indexPath) as? MovieInfoTableViewCell else {
            fatalError("Unable to Dequeue  Movie Info Table View Cell")
        }
        cell.movie = MovieViewModel(result: movieInfoList[indexPath.row])
        return cell
    }
}

