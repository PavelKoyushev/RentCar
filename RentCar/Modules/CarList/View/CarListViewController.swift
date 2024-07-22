//
//  CarListViewController.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import UIKit
import SnapKit

final class CarListViewController: UIViewController {
    
    private lazy var tableView = UITableView()
    
    private lazy var processingView = LoaderView()
    private lazy var errorView = AppErrorView()
    
    var presenter: CarListViewInputProtocol?
    
    enum Section {
        case cars
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, Car>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureDataSource()
        
        errorView.delegate = self
        presenter?.viewDidLoad()
    }
}

private extension CarListViewController {
    
    func configureUI() {
        
        title = "Auto list"
        makeConstraints()
        configureTableView()
    }
    
    func makeConstraints() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureTableView() {
        
        tableView.do {
            $0.delegate = self
            $0.register(cellType: CarListTableViewCell.self)
            $0.backgroundColor = .white
            $0.tableFooterView = UIView()
            $0.showsVerticalScrollIndicator = false
            $0.bounces = true
            $0.separatorStyle = .none
            $0.rowHeight = UITableView.automaticDimension
        }
    }
}

extension CarListViewController: CarListViewOutputProtocol {
    
    func showCarList(model: [Car]) {
        self.createSnapshot(data: model)
        self.tableView.reloadData()
    }
    
    func showLoader() {
        view.addSubview(processingView)
        
        processingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func hideLoader() {
        processingView.removeFromSuperview()
    }
    
    func showErrorView() {
        view.addSubview(errorView)
        
        errorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func hideErrorView() {
        errorView.removeFromSuperview()
    }
}

extension CarListViewController: AppErrorViewProtocol {
    
    func repeatTapped() {
        presenter?.viewDidLoad()
    }
}

private extension CarListViewController {
    
    func configureDataSource() {
        
        dataSource = UITableViewDiffableDataSource<Section, Car>(tableView: tableView, cellProvider: { (tableview, indexpath, model) -> UITableViewCell? in
            let cell: CarListTableViewCell  = tableview.dequeueReusableCell(for: indexpath)
            
            cell.configureCell(with: model)
            
            return cell
        })
    }
    
    func createSnapshot(data: [Car]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
        
        snapshot.appendSections([.cars])
        snapshot.appendItems(data)
        
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}

extension CarListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectRowAt(indexPath: indexPath)
    }
}
