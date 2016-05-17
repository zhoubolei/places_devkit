# Places365 Development Kit

=================================================
Introduction
=================================================

This is the documentation of the Places365 challenge 2016 development kit.

Table of contents:
- Overview of challenge dataset
- Challenge details
    1. Image list and annotations
    2. Submission format
    3. Evaluation routines

Please contact Bolei Zhou (bzhou@csail.mit.edu) for questions, comments, or bug reports.

**Note: Please first download the image list and annotations for [Places365-Standard](http://places2.csail.mit.edu/challenge2016/filelist_places365-standard.tar) and the image list and annotations for [Place365-challenge](http://places2.csail.mit.edu/challenge2016/filelist_places365-challenge.tar), and decompress the files in the data folder.**

=================================================
1. Overview of challenge dataset
=================================================

There are three types of image data for this competition: training
data from Places365-Challenge (TRAINING), validation data specific to this
competition (VALIDATION), and test data specific to this competition
(TEST).  There is no overlap in the three sources of data: TRAINING,
VALIDATION, and TEST.  All three sets of data contain images of 365
categories of scenes.

                 Number of images

    Dataset      TRAIN      VALIDATION     TEST
   -----------------------------------------------
    Places365    8,026,628      36,500      328,500

Every image in training, validation and test sets has a single
image-level label specifying the presence of one scene category

Challenge database statistics:

  Training:
    
    - 8,097,967 images, with between 3068 and 40,000 per category

  Validation:

    - 36,500 images, with 50 images per category

  Test:

    - 328,500 images, with 900 images per category

Packaging details:


The 3 sets of images (training, validation and test) are available as 
3 tar archives. All images are in JPEG format. We provide both the original 
images and images resized to 256*256 for download.


=================================================
2. Challenge details
=================================================

The 365 scene categories used in the challenge dataset are part of the 
larger Places2 dataset.

All the class names and ids are available in:
    data/categories_places365.txt,

where each line contains the scene category name followed by its id
(an integer between 0 and 364).

The difference betweee Places365-challenge and Places365-standard is 
that there are ~6.2million more extra images in Places365-challenge 
compared to Places365-standard. The first 5000 images (or less) per 
category in Places365-challenge belong to the Places365-standard.

---------------------------
2.1.1 Training data
---------------------------

Each image is considered as belonging to a particular scene category. 
See [1] for more details of the collection and labeling strategy.

The training images may be downloaded as a single tar archive. 
Within it there is a tar file for each alphabet from 'a.tar' to
'z.tar'. Note that there are 24 such files as there are no scene
category names beginning with 'q' and 'x' in our database.

After untarring all of the above files, the directory structure should
look similar to the following:
     a/abbey/00000000.jpg
     a/abbey/00000001.jpg
           ...
     z/zen_garden/00009067.jpg      
     z/zen_garden/00009068.jpg

In general, each leaf folder contains one scene category. Note that there 
are some categories that are fine-grained, e.g., s/swimming_pool/indoor
and s/swimming_pool/outdoor. The complete list of training images and their 
mapping to scene category ids is available in:
     data/places365_train_challenge.txt
     
All images are in JPEG format. We also include the data/places365_train_standard.txt
here, you don't need to use it.


-----------------------------
2.1.2 Validation data
-----------------------------

There are a total of 36,500 validation images. They are named as

      Places365_val_00000001.jpg
      Places365_val_00000002.jpg
      ...
      Places365_val_00036499.jpg
      Places365_val_00036500.jpg

There are 50 validation images for each scene category.

The classification ground truth of the validation images is in 
    data/places365_val.txt,
    
where each line contains one image filename and its corresponding scene
category label (from 0 to 364).

-----------------------
2.1.3 Test data
-----------------------

There are a total of 328,500 test images. The test files are named as

      Places365_test_00000001.jpg
      Places365_test_00000002.jpg
      ...
      Places365_test_00328499.jpg
      Places365_test_00328500.jpg

There are 900 test images for each scene category. The ground truth 
annotations will not be released.


*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
2.2 Submission format
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

The submission of results on test data will consist of a text file
with one line per image, in the alphabetical order of the image file
names, i.e. from Places365_test_00000001.jpg to
Places365_test_00328500.jpg. Each line contains up to 5 detected
scenes, sorted by confidence in descending order. 

The format is as follows:

   <filename> <label(1)> <label(2)> <label(3)> <label(4)> <label(5)>

The predicted labels are the scene categories ( integers between 0 and
364 ).  The number of labels per line must be exactly equal to 5, or it
would lead to an error. The filename is the same as mentioned above,
e.g., 'Places365_test_00000001.jpg' and so on.

Example file on the validation data is 

  evaluation/demo.val.pred.txt    


*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
2.3 Evaluation routines
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

The Matlab routine for evaluating the submission is

./evaluation/eval_cls.m  

To see an example of using the routines, start Matlab
in the 'evaluation/' folder and type
       demo_eval_cls;

and you will see something similar to the following output:

PLACES365 SCENE CLASSIFICATION TASK
pred_file: demo.val.pred.txt
ground_truth_file: ../data/places365_val.txt
# guesses vs cls error
    1.0000    0.9974
    2.0000    0.9944
    3.0000    0.9920
    4.0000    0.9893
    5.0000    0.9867
    
In this demo, we take top i ( i=1...5) predictions (and ignore the
rest) from your result file and plot the error as a function of the
number of guesses. 

Only the error with 5 guesses will be used to determine the winner.

(The demo.val.pred.txt used here is a synthetic result.)


====================================================================
References
====================================================================

[1] B. Zhou, A. Khosla, A. Lapedriza, A. Torralba and A. Oliva
Places: An Image Database for Deep Scene Understanding
Arxiv, 2015 (PDF coming soon)
http://places2.csail.mit.edu

