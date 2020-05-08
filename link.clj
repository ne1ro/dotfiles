(ns link
  (:require [clojure.java.io :as io])
  (:import [java.nio.file Files] [java.nio.file.attribute FileAttribute]))

(def dotfiles-dir (System/getProperty "user.dir"))
(def user-home (System/getProperty "user.home"))

(def dotfiles
  ["doom.d" "git_commit_msg.txt" "gitconfig"
   "curlrc" "zshrc.local" "gitignore_global"])

(defn- remove-existed [file]
  (when (.exists file)
    (let [path (.getPath file)]
      (println (str "Removing file " path))
      (clojure.java.io/delete-file path))))

(defn- remove-and-link [file]
  (let [linking-file (io/file user-home (str "." file))
       linked-file (io/file dotfiles-dir file)]
    (remove-existed linking-file)
    (Files/createSymbolicLink
     (.toPath linking-file)
     (.toPath linked-file)
     (into-array FileAttribute []))))

(->> dotfiles (map remove-and-link) (map str) println)
