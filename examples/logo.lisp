(ql:quickload :cl-pov :silent t)

(defun ball (color)
  `(:object
    (:sphere <1 1 1> 1)
    (:pigment ,color)))

(defun box (color)
  `(:object
    (:box <0 0 0> <1 1 1>)
    (:pigment ,color)))

(defun cone (color)
  `(:object
    (:cone <0 0 0> 1 <0 1 0> 0)
    (:pigment ,color)))

(defun logo nil
  `(:text
    (:ttf #?"timrom.ttf" #?"CL-POV" 1 0)
    (:pigment "Gray80")
    (:scale <2 2 2/5>)
    (:translate <-3.5 0.01 -2.5>)))

(defun camera nil
  `(:camera
    (:location <0 3.5 -10>)
    (:look_at <0 0 -2>)
    (:angle 50)))

(defun light_source nil
  `(:light_source
    <5 30 -30> "White"))

(defun plane nil
  `(:plane
    :y 0
    (:texture
     (:pigment "White"))))

(defvar background
  '(:background "White"))

(pov:ray
 t
 (:include #?"colors.inc")
 (:include #?"textures.inc")
 (:include #?"glass.inc")
 (camera)
 (light_source)
 (plane)
 background
 (:union
  (:object
   (ball "Red")
   (:scale 1/4)
   (:translate <0 0 -5>))
  (:object
   (box "Blue")
   (:scale 1/3)
   (:translate <1 0 -4.8>))
  (:object
   (cone "Green")
   (:scale <1/5 2/5 1/5>)
   (:translate <-0.7 0 -4.7>))
  (:translate <-0.25 0 0>))
 (logo))
