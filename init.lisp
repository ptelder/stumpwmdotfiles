;; -*-lisp-*-
;;
;; Stumpwm user definitions

;; This is where I would set up a quick check to see if
;; the org file has a more recent modify date an re-tangle
;; it if needed. Hopefully I pick up enough CLisp along the
;; way to make that happen...

;; Well... Now it checks for the existence of the tangled file.
;; Now we just have to tangle if missing, then do the freshness check.
;; The func FILE-WRITE-DATE will spit out the unix time for a file


(defvar *tangled-path*
  ;; When initializing, StumpWM seems to use ~ as the working directory...
  (concatenate 'string
	       (namestring (probe-file "."))
	       ".stumpwm.d/"
	       "stump_conf.lisp"))

(defvar *tangler-path*
  (concatenate 'string
	       (namestring (probe-file "."))
	       ".stumpwm.d/"
	       "tangle.elisp"))

(if
 (probe-file *tangled-path*)
 (load *tangled-path*)
 (progn
   (sb-ext:run-program *tangler-path* ())
   (load *tangled-path*)))
