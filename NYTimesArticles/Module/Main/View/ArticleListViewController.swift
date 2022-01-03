//
//  ArticleListViewController.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/30/21.
//

import UIKit

class ArticleListViewController: UIViewController {
    // MARK: IbOutLet
    @IBOutlet weak var articleListTableView: UITableView!
    // MARK: varibles
    private var mainViewModel: MainViewModel?

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        articleListTableView.delegate = self
        articleListTableView.dataSource = self
        registerTableViewCells()
        callToViewModelForUIUpdate()
    }
    
    // MARK: Helping Function
    private func registerTableViewCells() {
        let articleTableViewCell = UINib(nibName: "ArticleTableViewCell",
                                  bundle: nil)
        articleListTableView.register(articleTableViewCell , forCellReuseIdentifier: "articleCell")
    }
    //this function from init view model and add callBack function logic from binding btween view and view model which will happend when api response come from webserice
    private func callToViewModelForUIUpdate(){
        self.mainViewModel =  MainViewModel()
        self.mainViewModel?.bindMainViewModelToController = {
            self.updateDataSource()
            return self
        }
    }
    // this function for notify data source that there was change in data 
    private func updateDataSource(){
        if mainViewModel?.articlesArray?.count ?? 0 > 0{
            articleListTableView.reloadData()
        }
    }
        
}
// MARK: view model Action handling
extension ArticleListViewController {
    func pushToView(view: UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}
// MARK: extention for TableViewDelegate
extension ArticleListViewController:UITableViewDelegate {
    
}
// MARK: extention for TableviewDataSource
extension ArticleListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel?.articlesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell
        if let articleArray = mainViewModel?.articlesArray {
            cell?.bindData(articleArray[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainViewModel?.selectArticle(at: indexPath.row)
    }
}

extension ArticleListViewController: viewBindDelegate {
    func pushToView(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
