# Converts a video file to as set of frames
# Results are stored in the specified path

function vid_to_frames(vid_name::String, path::String)
    cd(path)
    c1 = `ffmpeg -i $(vid_name) -qscale:v 1 image%d.jpg`
    run(c1)
end

# Extracts the audio from a video file
# Results are stored in the specified path

function vid_to_aud(vid_name::String, path::String)
    cd(path)
    c1 = `ffmpeg -i $(vid_name) -vn -ar 44100 -ac 2 -ab 192 -f wav audio.wav`
    run(c1)
end

# Combines a video and audio file
# Results are stored in the specified path

function vid_merge_aud(vid_name::String, aud_name::String, path::String)
    cd(path)
    c1 = `ffmpeg -i $(vid_name) -i $(aud_name) -c:v copy -c:a aac -strict experimental output.mp4`
    run(c1)
end

# Converts a set of frames to a video
# Results are stored in the specified path

function frames_to_vid(frame_rate::Int64, path::String)
    cd(path)
    c1 = `ffmpeg -r $(frame_rate) -f image2 -i image%d.jpg -vcodec mpeg4 -c:v copy output_video.mp4`
    run(c1)
end

ffmpeg -r 30 -f image2 -i %d-outputs.png -vcodec mpeg4 -c:v copy output_video.mp4

ffmpeg -i WA.mp4 -vn -ar 44100 -ac 2 -ab 192 -f wav audio.wav
