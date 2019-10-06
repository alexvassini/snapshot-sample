//
//  MoviesRepository.swift
//  TheMovieApp
//
//  Created by Alexandre Vassinievski Ribeiro on 20/02/19.
//  Copyright © 2019 Alexandre Vassinievski Ribeiro. All rights reserved.
//

import RxSwift
import Moya

protocol FeedRepository: class {

    func searchRepositories(language: String, page: Int) -> Single<[GitRepository]>

}
