import sys
import dlib

from skimage import io

file_name = sys.argv[1]
face_detector = dlib.get_frontal_face_detector()
win = dlib.image_window()
image = io.imread(file_name)
detected_faces = face_detector(image, 1)
print("I found {} faces in file {}.".format(len(detected_faces), file_name))

#open a window on desktop showing the image
win.set_image(image)

#loop through each face found in the image
for i, face_rect in enumerate(detected_faces):
    #detected faces are returned as an object with the coordinates
    #of the top, left, right and bottom edges
    print("-Face #{} found at LEFT: {}, TOP: {}, RIGHT: {}, BOTTOM: {}".\
          format(i, face_rect.left(), face_rect.top(), face_rect.right(), face_rect.bottom()))
    #draw that box around found faces
    win.add_overlay(face_rect)

#expected enter to close the window
dlib.hit_enter_to_continue()