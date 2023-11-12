#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
#


CODES='40000 60000 80000'
THREADS=24

DATA_PATH=../dataset/yelp
NAME_PATH=../names
PROC_DATA_PATH=$DATA_PATH/processed
FINAL_DATA_PATH=$PROC_DATA_PATH/style_transfer

BPE=../fastBPE/fast
FASTTEXT=../fastTextInstall/bin/fasttext

MOSES_PATH=../mosesdecoder
TOKENIZER=$MOSES_PATH/scripts/tokenizer/tokenizer.perl
NORMALIZER=$MOSES_PATH/scripts/tokenizer/normalize-punctuation.perl
LOWERCASER=$MOSES_PATH/scripts/tokenizer/lowercase.perl

LID_PATH=../models/lid.176.bin
CAT_CLF_PATH=../models/yelp_categories.model.bin


echo "#############################"
echo "Creating human test set from hashes"
echo "#############################"

python ../create_human_test_set.py \
    -fpath ../human_test/yelp/hashed \
    -ref $FINAL_DATA_PATH/fader.review \
    -opath ../human_test/yelp/proc
