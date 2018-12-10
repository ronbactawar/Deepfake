# Deepfake 

Abstract: This repository attempts to reproduce the results of (1) ObamaNet project and (2) Face2Face project

OBAMANET (OBJECTIVE)

The objective of ObamaNet is to simulate speaking dynamics (on Obama) using an audio voice.  An LSTM network is used to convert audio signals into facial keypoints which are then used by Pix2Pix to render predicted images of Obama.  Images are then combined into a video with the audio to demonstrate Obama speaking.    


OBAMANET (INSTRUCTIONS)

Download the obamanet folder

	Extract the contents of the supplement folder into the obamanet folder

	Link to obamanet folder: https://drive.google.com/open?id=1824s4K-cmhkYTPBDUSlCoVgSJbIl4c-e

	Link to supplement: https://drive.google.com/open?id=1gAYaqg1rcGuMjfc-at-7a86wbTApwjD9

Inside the obamanet folder choose an audio (ie. sagan.wav)

	run: python run.py --sf data/audios/sagan.wav

	This accepts an audio (ie. sagan.wav) for processing and outputs a folder called testing_output_images




Inside the obamanet folder:

	run: python3 pix2pix.py --mode test --output_dir test_output/ --input_dir testing_output_images/ --checkpoint 	checkpoints/output/

	This productes a folder called /test_output/images that contains images of 1) Drawn in mouth representation and 2) The real mouth representation (outputs)




Inside images folder (/obamanet/test_output/images):

	run: ffmpeg -r 30 -f image2 -i %d-outputs.png -vcodec mpeg4 -c:v copy output_video.mp4

	This action combines the images into a video




Inside a folder containing both the audio (sagan.wav) and video (output_video.mp4):

	run: ffmpeg -i output_video.mp4 -i sagan.wav -c:v copy -c:a aac -strict experimental output.mp4

	This combines the audio and video files






To train a set of images in a directory (ie. c_train) :

	training: Requires mouth (drawing) and mouth (real) side by side

	run:  python3 pix2pix.py --mode train --output_dir output --max_epochs 1 --input_dir c_train --which_direction AtoB
	
FACE2FACE (INSTRUCTIONS)

1.Dataset

The video file of Angela Merkel (German Chancellor) was used to create the dataset. The number of training data required should be mentioned. In this case 400 images were considered. To detect the facial landmarks used shape_predictor_68_face.landmarks.dat file. Two folders, original and landmarks will be created. The original folder containing the actual image and the landmarks folder contains facial landmarks.

2.Pix2Pix

The original and landmark images are resized and then combined. The combined images are split as training and validation dataset. The model is trained with different number of epochs (10,133,200) to check the performance of the model.

3.Reduced model

The trained model is reduced to have a less file size. The reduced model is then freezed to a single file. It returns a frozen model file frozen_model.pb.

4.Output

Input to run the demo- camera device index(default=0), show to display the normal input (default = 0), landmark model and frozen model.


References 

Suwajanakorn, S., Seitz, S. M., & Kemelmacher-Shlizerman, I. (2017). Synthesizing Obama. ACM Transactions on Graphics, 36(4), 1-13. doi:10.1145/3072959.3073640 

Bhargava Karan, ObamaNet : Lip Sync from Audio, (2017), GitHub repository, https://github.com/karanvivekbhargava/obamanet
 
https://github.com/datitran/face2face-demo
 
https://github.com/affinelayer/pix2pix-tensorflow
