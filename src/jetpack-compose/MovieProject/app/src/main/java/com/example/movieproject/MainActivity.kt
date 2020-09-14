package com.example.movieproject

import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.Composable
import androidx.compose.getValue
import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.ui.core.*
import androidx.ui.foundation.*
import androidx.ui.layout.*
import androidx.ui.livedata.observeAsState
import androidx.ui.unit.dp
import com.example.movieproject.composable.GlideImage
import com.example.movieproject.data.Movie
import com.example.movieproject.data.networkService
import com.example.movieproject.ui.*
import com.example.movieproject.viewModel.MainViewModel

class MainActivity : AppCompatActivity() {

    private val viewModel by viewModels<MainViewModel> {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel?> create(modelClass: Class<T>): T {
                return MainViewModel(
                    networkService
                ) as T
            }
        }
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MovieProjectTheme {
                VerticalScroller(modifier = Modifier.padding(16.dp)) {
                    Text(text = "Now Playing", style = typography.h1)
                    HorizontalScroller(modifier = Modifier.fillMaxWidth()) {
                        NowPlayingRow(moviesData = viewModel.nowPlayingMoviesData)
                    }
                    Text(text = "Popular", style = typography.h1)
                    PopularMoviesColumn(moviesData = viewModel.popularMoviesData)
                }
            }
        }

        viewModel.getPopular()
        viewModel.getNowPlaying()
    }

    @Composable
    fun PopularMoviesColumn(moviesData: LiveData<List<Movie>>) {
        val movies by moviesData.observeAsState(emptyList())
        Column(modifier = Modifier.padding(top = 16.dp)) {
            for (index in movies) {
                Clickable(onClick = {
                    val intent = Intent(this@MainActivity, DetailsActivity::class.java)
                    intent.putExtra("movieId", index.id)
                    startActivity(intent)
                }) {
                    PopularMovieCard(movie = index)
                }
            }
        }
    }

    @Composable
    fun NowPlayingRow(moviesData: LiveData<List<Movie>>) {
        val movies by moviesData.observeAsState(emptyList())
        Row() {
            for (index in movies) {
                val imageModifier = Modifier
//                .preferredHeightIn(maxHeight = 350.dp)
                        .height(225.dp)
                        .width(150.dp)
                        .clip(shape = shapes.medium)
                Clickable(onClick = {
                    val intent = Intent(this@MainActivity, DetailsActivity::class.java)
                    intent.putExtra("movieId", index.id)
                    startActivity(intent)
                }) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        GlideImage(url = posterURL + index.poster, imageModifier = imageModifier)
                    }
                }
            }
        }
    }

    @Composable
    fun PopularMovieCard(movie: Movie) {
        Row(modifier = Modifier.fillMaxWidth()) {
            Column(modifier = Modifier.padding(16.dp, 8.dp)
            ) {
                val imageModifier = Modifier
                        .height(150.dp)
                        .width(100.dp)
                        .clip(shape = shapes.medium)

                GlideImage(url = posterURL + movie.poster, imageModifier = imageModifier)
            }

            Column(
                    modifier = Modifier.padding(0.dp, 8.dp)
            ) {
                Text(text = movie.title, style = typography.body1)
                Text(text = movie.date, style = typography.body1)
                Text(text = movie.rating, style = typography.body1)
            }
        }
    }

}




