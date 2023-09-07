//
//  ViewController.swift
//  AppCollectionView
//
//  Created by Diego Rodrigues on 04/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal// Defina o scroll para ser horizontal
        layout.minimumLineSpacing = 16
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
                
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 280, height: 200) // Tamanho da célula
            
                    }
                }
   
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.configure()// Implementei esse método na classe CardCell
        
        // Definir o tamanho da célula com base no tamanho real da célula
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right - flowLayout.minimumLineSpacing
            cell.frame.size.width = cellWidth
        }
        
        return cell
    }
}

  
