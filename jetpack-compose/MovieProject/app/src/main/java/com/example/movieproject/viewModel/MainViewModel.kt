package com.example.movieproject.viewModel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.movieproject.data.Movie
import com.example.movieproject.data.NetworkService
import kotlinx.coroutines.launch

class MainViewModel(
    private val networkService: NetworkService
) : ViewModel() {

    private val _popularMoviesData = MutableLiveData<List<Movie>>()
    val popularMoviesData: LiveData<List<Movie>>
        get() = _popularMoviesData

    fun getPopular() {
        viewModelScope.launch {
            try {
                val movies = networkService.getPopularMovies()
                _popularMoviesData.value = movies.popularMovies
            } catch (e: Exception) {
                Log.d("Service Error:", e.toString())
            }
        }
    }

    private val _nowPlayingMoviesData = MutableLiveData<List<Movie>>()
    val nowPlayingMoviesData: LiveData<List<Movie>>
        get() = _nowPlayingMoviesData

    fun getNowPlaying() {
        viewModelScope.launch {
            try {
                val movies = networkService.getNowPlayingMovies()
                Log.d("name", "bully" + movies.popularMovies[0].title)
                _nowPlayingMoviesData.value = movies.popularMovies
            } catch (e: Exception) {
                Log.d("Service Error:", e.toString())
            }
        }
    }
}