const express = require('express');
const youtubedl = require('youtube-dl-exec');

const app = express();

app.get('/get-url', async (req, res) => {
  const videoId = req.query.videoId;
  const videoUrl = `https://www.youtube.com/watch?v=${videoId}`;
  
  try {
    const output = await youtubedl(videoUrl, {
      dumpSingleJson: true,
      noWarnings: true,
      format: 'bestaudio',
    });
    
    res.json({
      audio_url: output.url,
      title: output.title,
      thumbnail: output.thumbnail,
    });
  } catch (error) {
    res.status(500).send({ error: 'Failed to fetch URL' });
  }
});

app.listen(3000, () => console.log('Server running on port 3000'));  