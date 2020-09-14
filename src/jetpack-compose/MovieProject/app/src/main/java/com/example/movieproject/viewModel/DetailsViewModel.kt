package com.example.movieproject.viewModel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.movieproject.data.MovieDetail
import com.example.movieproject.data.NetworkService
import com.example.movieproject.data.Video
import kotlinx.coroutines.launch

class DetailsViewModel(
    private val networkService: NetworkService
) : ViewModel() {

    private val _movieDetailsData = MutableLiveData<MovieDetail>()
    val movieDetailsData: LiveData<MovieDetail>
        get() = _movieDetailsData

    fun getDetails(movieId: Int) {
        viewModelScope.launch {
            try {
                val movie = networkService.getDetails(movieId)
                _movieDetailsData.value = movie
            } catch (e: Exception) {
                Log.d("Service Error:", e.toString())
            }
        }
    }

    private val _videoData = MutableLiveData<List<Video>>()
    val videoData: LiveData<List<Video>>
        get() = _videoData

    fun getVideos(movieId: Int) {
        viewModelScope.launch {
            try {
                val movie = networkService.getVideo(movieId)
                _videoData.value = movie.results
            } catch (e: Exception) {
                Log.d("Service Error:", e.toString())
            }
        }
    }

}