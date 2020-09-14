package com.example.movieproject

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.Composable
import androidx.compose.getValue
import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.ui.core.Alignment
import androidx.ui.core.ContextAmbient
import androidx.ui.core.Modifier
import androidx.ui.core.setContent
import androidx.ui.foundation.Clickable
import androidx.ui.foundation.Icon
import androidx.ui.foundation.Text
import androidx.ui.foundation.VerticalScroller
import androidx.ui.layout.*
import androidx.ui.livedata.observeAsState
import androidx.ui.material.Divider
import androidx.ui.res.vectorResource
import androidx.ui.text.TextStyle
import androidx.ui.unit.dp
import androidx.ui.unit.sp
import com.example.movieproject.composable.GlideImage
import com.example.movieproject.data.MovieDetail
import com.example.movieproject.data.Video
import com.example.movieproject.data.networkService
import com.example.movieproject.ui.*
import com.example.movieproject.viewModel.DetailsViewModel


class DetailsActivity : AppCompatActivity() {

    private val viewModel by viewModels<DetailsViewModel> {
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel?> create(modelClass: Class<T>): T {
                return DetailsViewModel(
                    networkService
                ) as T
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val movieId: Int = intent.getIntExtra("movieId",0)
        setContent {
            MovieProjectTheme() {
                DetailsPage(movieDetail= viewModel.movieDetailsData, videos = viewModel.videoData)
            }
        }
        viewModel.getDetails(movieId)
        viewModel.getVideos(movieId)
    }

    @Composable
    fun DetailsPage(movieDetail: LiveData<MovieDetail>, videos: LiveData<List<Video>>) {
        val movie by movieDetail.observeAsState(initial = null)
        val videos by videos.observeAsState(emptyList())
        val context = ContextAmbient.current

        if (movie != null) {
            VerticalScroller() {
                Column {
                    val imageModifier = Modifier
                        .fillMaxWidth()
                    Text(text = movie!!.title, style = typography.h1, modifier = Modifier.padding(start= 10.dp))
                    GlideImage(url = backDropURL + movie!!.backDrop, imageModifier = imageModifier)
                    Row(modifier = Modifier.fillMaxWidth().padding(bottom = 10.dp, start = 10.dp, end = 10.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                        Text(text = movie!!.date, style = typography.body1)
                        Text(text = "${(movie!!.runtime).div(60)}hrs ${(movie!!.runtime)%60}mins", style = typography.body1)
                    }
                    Divider()
                    if (movie!!.tagline != "") {
                        Text(text = "\"${movie!!.tagline}\"", modifier = Modifier.padding(all = 10.dp).gravity(align = Alignment.CenterHorizontally), style = bodyItalics)
                    } else {
                        Text(text = "N/A", modifier = Modifier.padding(all = 10.dp).gravity(align = Alignment.CenterHorizontally), style = bodyItalics)
                    }
                    Divider()
                    Text(text = "Overview", style = bodyBold, modifier = Modifier.padding(top = 10.dp, start = 10.dp, end = 10.dp))
                    Text(text = movie!!.description, modifier = Modifier.padding(bottom = 10.dp, start = 10.dp, end = 10.dp))
                    Divider()
                    Row(modifier = Modifier.fillMaxWidth().padding(all = 10.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                        Text(text = "Rating", style = bodyBold)
                        Text(text = movie!!.rating + "/10", style = typography.body1)
                    }
                    Divider()
                    Text(text = "Clips and Trailers", style = bodyBold, modifier = Modifier.padding(start = 10.dp, top = 10.dp, bottom = 5.dp))
                    Column(modifier = Modifier.padding(bottom = 15.dp)) {
                        for (index in videos) {
                            Clickable(onClick = {
                                if (index.site == "YouTube") {
                                    val uri: Uri =
                                        Uri.parse("https://www.youtube.com/watch?v=" + index.key)
                                    val intent = Intent(Intent.ACTION_VIEW, uri)
                                    startActivity(intent)
                                } else {
                                    Toast.makeText(context, "Link is not YouTube", Toast.LENGTH_SHORT).show()
                                }
                            }) {
                                Row(modifier = Modifier.fillMaxWidth().padding(start = 10.dp, end = 10.dp, bottom = 5.dp, top = 5.dp), horizontalArrangement = Arrangement.SpaceBetween) {
                                    Row(modifier = Modifier.width(320.dp)) {
                                        Text(text = index.name, style = TextStyle(color = blue, fontSize = 16.sp))
                                    }
                                    Icon(asset = vectorResource(id = R.drawable.ic_baseline_launch_24), tint = blue)
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}