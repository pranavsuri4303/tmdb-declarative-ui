package com.example.movieproject.data

import com.squareup.moshi.Json

data class MoviesAPI (
    @field:Json(name = "results")
    val popularMovies: List<Movie>
)

data class Movie (
    @field:Json(name = "title")
    val title: String,
    @field:Json(name = "release_date")
    val date: String,
    @field:Json(name = "vote_average")
    val rating: String,
    @field:Json(name = "poster_path")
    val poster: String,
    @field:Json(name = "id")
    val id: Int
)

data class MovieDetail (
    @field:Json(name = "title")
    val title: String,
    @field:Json(name = "release_date")
    val date: String,
    @field:Json(name = "vote_average")
    val rating: String,
    @field:Json(name = "overview")
    val description: String,
    @field:Json(name = "backdrop_path")
    val backDrop: String,
    @field:Json(name = "tagline")
    val tagline: String,
    @field:Json(name = "runtime")
    val runtime: Int
)

data class VideoAPI (
    @field:Json(name = "results")
    val results: List<Video>
)

data class Video (
    @field:Json(name = "name")
    val name: String,
    @field:Json(name = "id")
    val id: String,
    @field:Json(name = "key")
    val key: String,
    @field:Json(name = "site")
    val site: String
)