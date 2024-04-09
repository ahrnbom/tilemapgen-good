#!/usr/bin/env python

from distutils.core import setup

setup(name='tilemapgen-good',
      version='0.0.1',
      description='Forked package of tilemapgen, which is a tool to generate isometric tilemaps from text prompts',
      author='Ahrnbom (original repo by Jeremy Tryba)',
      url='https://github.com/ahrnbom/tilemapgen-good',
      packages=['tilemapgen'],
      package_dir={'': 'src'},
      py_modules=['tilemapgen'],
      install_requires=[
          'torch==2.2.1',
          'torchvision==0.17.1',
          'transformers==4.39.3',
          'diffusers==0.27.2',
          'pyrallis==0.3.1',
          'pytorch3d==0.7.6'
      ],
      scripts=['scripts/tilemapgen'],
     )
