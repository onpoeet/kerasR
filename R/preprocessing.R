#' Load image from a file as PIL object
#'
#' @param path         Path to image file
#' @param grayscale    Boolean, whether to load the image as grayscale.
#' @param target_size  If NULL, the default, loads the image in its native
#'                       resolution. Otherwise, set this to a vector giving
#'                       desired (img_height, img_width).
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
load_img <- function(path, grayscale = FALSE, target_size = NULL) {

  if (!is.null(target_size))
    target_size <- as.integer(target_size)

  modules$keras.preprocessing.image$load_img(path = path, grayscale = grayscale,
                                             target_size = target_size)
}

#' Converts a PIL Image instance to a Numpy array.
#'
#' @param img          PIL image file; usually loaded with \code{load_img}
#' @param data_format  either "channels_first" or "channels_last".
#'
#' @return A 3D numeric array.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
img_to_array <- function(img, data_format = NULL) {
  modules$keras.preprocessing.image$img_to_array(img = img, data_format = data_format)
}

#' Expand dimensions of an array
#'
#' Expand the shape of an array by inserting a new axis, corresponding to
#' a given position in the array shape. Useful when predicting a model based
#' on a single input.
#'
#' @param a      array to expand
#' @param axis   position (amongst axes) where new axis is to be inserted.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
expand_dims <- function(a, axis = 0) {
  modules$np$expand_dims(a = a, axis = int32(axis))
}

#' Split a sentence into a list of words.
#'
#' @param text      a string
#' @param filters   vector (or concatenation) of characters to filter out, such as punctuation.
#' @param lower     boolean. Whether to set the text to lowercase.
#' @param split     string. Separator for word splitting.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
text_to_word_sequence <- function(text, filters = '!"#$%&()*+,-./:;<=>?@[\\]^_`{|}~\t\n',
                                  lower = TRUE, split = " ") {
  modules$keras.preprocessing.text$text_to_word_sequence(text = text, filters = filters,
                                                          lower = lower, split = split)
}

#' One-hot encode a text into a list of word indexes in a vocabulary of size n.
#'
#' @param text      a string
#' @param n         integer. Size of vocabulary.
#' @param filters   vector (or concatenation) of characters to filter out, such as punctuation.
#' @param lower     boolean. Whether to set the text to lowercase.
#' @param split     string. Separator for word splitting.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
one_hot <- function(text, n, filters = '!"#$%&()*+,-./:;<=>?@[\\]^_`{|}~\t\n',
                    lower = TRUE, split = " ") {
  modules$keras.preprocessing.text$one_hot(text = text, n = int32(n), filters = filters,
                                           lower = lower, split = split)
}

#' Tokenizer
#'
#' Returns an object for vectorizing texts, or/and turning texts into sequences
#' (=list of word indexes, where the word of rank i in the dataset (starting at 1)
#' has index i).
#'
#' @param num_words  integer. None or int. Maximum number of words to work with.
#' @param filters    vector (or concatenation) of characters to filter out, such as punctuation.
#' @param lower      boolean. Whether to set the text to lowercase.
#' @param split      string. Separator for word splitting.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
Tokenizer <- function(num_words = NULL, filters = '!"#$%&()*+,-./:;<=>?@[\\]^_`{|}~\t\n',
                    lower = TRUE, split = " ") {

  if (!is.null(num_words))
    num_words <- int32(num_words)

  modules$keras.preprocessing.text$Tokenizer(num_words = num_words, filters = filters,
                                              lower = lower, split = split)
}

#' Pad a linear sequence for an RNN input
#'
#' Transform a list of num_samples sequences (lists of scalars) into a 2D
#' Numpy array of shape  (num_samples, num_timesteps). num_timesteps is
#' either the maxlen argument if provided, or the length of the longest
#' sequence otherwise. Sequences that are shorter than num_timesteps are
#' padded with value at the end. Sequences longer than num_timesteps are
#' truncated so that it fits the desired length. Position where padding or
#' truncation happens is determined by padding or truncating, respectively.
#'
#' @param sequences   vector of lists of int or float.
#' @param maxlen      None or int. Maximum sequence length, longer sequences are truncated and shorter sequences are padded with zeros at the end.
#' @param dtype       datatype of the Numpy array returned.
#' @param padding     'pre' or 'post', pad either before or after each sequence.
#' @param truncating  'pre' or 'post', remove values from sequences larger than maxlen either in the beginning or in the end of the sequence
#' @param value       float, value to pad the sequences to the desired value.
#'
#' @author Taylor B. Arnold, \email{taylor.arnold@@acm.org}
#' @references
#'
#'   Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
#'
#' @export
pad_sequences <- function(sequences, maxlen = NULL, dtype = 'int32',
                          padding = 'pre', truncating = 'pre',
                          value = 0) {

  if (!is.null(maxlen))
    maxlen <- int32(maxlen)

  sequences <- lapply(sequences, int32)

  modules$keras.preprocessing.sequence$pad_sequences(sequences = sequences,
                                                     maxlen = maxlen,
                                                     dtype = dtype,
                                                     padding = padding,
                                                     truncating = truncating,
                                                     value = value)
}



