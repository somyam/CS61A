![Test Image 2](https://github.com/somyam/CS61A/blob/master/Projects/Maps/687474703a2f2f696e73742e656563732e6265726b656c65792e6564752f7e63733631612f666131372f70726f6a2f6d6170732f76697375616c697a652f766f726f6e6f692e706e67.png)

**Introduction**


In this project, you will create a visualization of restaurant ratings using machine learning and the Yelp academic dataset (https://www.yelp.com/dataset). In this visualization, Berkeley is segmented into regions, where each region is shaded by the predicted rating of the closest restaurant (yellow is 5 stars, blue is 1 star). Specifically, the visualization you will be constructing is a Voronoi diagram.

In the map above, each dot represents a restaurant. The color of the dot is determined by the restaurant's location. For example, downtown restaurants are colored green. The user that generated this map has a strong preference for Southside restaurants, and so the southern regions are colored yellow.

This project uses concepts from Sections 2.1, 2.2, 2.3, and 2.4.3 of Composing Programs. It also introduces techniques and concepts from machine learning, a growing field at the intersection of computer science and statistics that analyzes data to find patterns and make predictions.