#!/usr/bin/env python
# -*- coding: utf-8 -*-

import fitsio
import argparse

def main(args):
    with fitsio.FITS(args.filename) as infile:
        image = infile[0].read()

    with open(args.output, 'w') as outfile:
        for y in xrange(image.shape[0]):
            for x in xrange(image.shape[1]):
                outfile.write('{x} {y} {flux}\n'.format(
                    x=x, y=y, flux=image[y, x]))
            


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    parser.add_argument('-o', '--output')
    main(parser.parse_args())
