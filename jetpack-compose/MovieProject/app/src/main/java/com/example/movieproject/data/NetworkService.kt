package com.example.movieproject.data

import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query
import com.example.movieproject.ui.apiKey
import com.example.movieproject.ui.baseURL
import retrofit2.http.Path

interface NetworkService {
    @GET("popular")
    suspend fun getPopularMovies(
            @Query("api_key")
            api_Key: String= apiKey
    ): MoviesAPI

    @GET("now_playing")
    suspend fun getNowPlayingMovies(
            @Query("api_key")
            api_Key: String= apiKey
    ): MoviesAPI

    @GET("{id}")
    suspend fun getDetails(
        @Path("id")
        id: Int,
        @Query("api_key")
        api_Key: String= apiKey
    ): MovieDetail

    @GET("{id}/videos")
    suspend fun getVideo(
        @Path("id")
        id: Int,
        @Query("api_key")
        api_Key: String= apiKey
    ): VideoAPI

}

val retrofit: Retrofit = Retrofit.Builder()
    .baseUrl(baseURL)
    .addConverterFactory(MoshiConverterFactory.create())
    .build()

val networkService: NetworkService = retrofit.create(NetworkService::class.java)