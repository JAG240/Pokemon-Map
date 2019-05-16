# Pokemon Map Project Review

Site publication: <http://bloodborne.newtfire.org/>

GitHub: <https://github.com/JAG240/Pokemon-Map>

Developers: 
* Jacob Gonos: @JAG240
* Alan Chen: @achen298

Date of Evaluation: 2019-05-15

Evaluated by: Elisa Beshero-Bondar: @ebeshero

### General  
The Pokemon project is visually appealing and fun to navigate, very user friendly in orienting people to the Pokemon world of Kanto. While there were some problems with processing the XML, these can be easily corrected. 

### Research questions
The team really wanted to make an XML database to organize and map information about Kanto, and struggled a bit to define a research question. However, exploring your data with network analysis helped to clarify a research interest in locating frequencies of Pokemon types along a route. 

Investigating the frequency and scarcity of Pokemon in a given game world makes an exciting long-range research topic if you want to explore this further by *comparing* game worlds. In a new phase of work, building on the codebase you modeled here, you could easily continue exploring this topic. You might also be able to compare which types of Pokemon appear in greater or lesser frequency in locations beyond Kanto. 

### XML data and XSLT processing
Your team produced an immense number of tiny short, carefully schema-controlled XML data files, and processing these for the website meant needing to write XSLT over a collection, which is making XSLT work the way XQuery was designed. The team’s coding strengths inclined to XQuery, and having to move to XSLT made the last stages of processing a little challenging. For the most part, the output is good, but we found a bug on your city pages: they contain duplicate information: a block of text repeated a second time. We dug into your XSLT to see how to fix it and left some comments on [this commit](https://github.com/JAG240/Pokemon-Map/commit/cb25de18d0e84a9740e2ccdc31d07d95e99bb3e4). We think this is something you can handle, and it will help you review XSLT a little and understand how its template rules work. You want to be matching on each `<des>` element in a separate rule here to control your output and stop the duplicate “data dump”.

You should check carefully to see whether this problem applies to other XSLT producing your Pokemon, landmark, and route pages as well. 

### SSI problem and invalid HTML:
There is a very serious problem with your Server Side Include, the Navbar.html file. The problem is that it contains a full and complete HTML file in its own right (including a root HTML element, its head, and its body). When you set your files to include this SSI, produces an HTML document *inside* your HTML documents which is not valid HTML. Web browsers are forgiving right now so they do display for you at the moment, but this is brittle code that can be easily fixed. An SSI is not a complete HTML document, but just a snip of code (so by definition the file is *not* supposed to be well-formed HTML). Often an SSI is just a `<div>`, `<section>`, or a `<ul>` element, or whatever HTML element contains your menu bar. You script it to be set inside your HTML pages where you want it to appear. When you change your navigation bar you only have to do it one place. Take some time to [review our tutorial in HTML Exercise 2](https://dh.newtfire.org/HTMLExercise2.html) to see how to do this properly, because making just *one* fix to that SSI will likely make the *entire* project site pass inspection with the [w3c validator](https://validator.w3.org/)! 

### “UX”: User Experience and Site Interface
With the exception of the problems above, your website is artfully designed and very appealing to the eye. We admire the simple elegance of taking the Kanto map image and zooming in to make a blurred background using the same colors. The choice of font and color and the small but sharp menu bar at the top left are minimalist and effective in using the screen real estate. And you did especially well with the fine balancing act of setting multiple network graphs in sequence in the networks page.  

There are some typos to fix: On the “About the Team” page, a sentence reads:
```
If you like to coding you can view the code we used over at our GitHub page here.
```
Beyond fixing the grammatical error, you could probably simplify this: 
```
If you like to code, come visit our GitHub repository!
```
The writing across the website (as with most of the projects) could generally use some attention to simplify it, and we recommend taking some time to review the writing on the Analysis page in particular. 

### Technologies for visualization 
The image map on the main page, meticulously prepared by Jacob, is a really impressive accomplishment as you learned how to work with an `<iframe>` element and bring information into view about each clickable area. You may just want to add some CSS padding or set a margin around the location page as it appears in the frame. The CSS should apply to the location page itself, where there seems to be no margins set and the text is (surprisingly in this otherwise eye-pleasing site) crammed into the margins.  

The network graphs that Alan designed are also carefully designed and filtered. As someone commented when you presented the project in Pittsburgh, that first network graph is difficult to *read*, however, and it needs a legend to tell us about the colors used. You might also want to try a different shape in Cytoscape, instead of separating all the routes from all the types.  Try prioritizing the nodes that have the highest degree to see how the graph looks. 

The smaller networks make wonderful, highly legible diagrams, and really, they ought to be integrated with your site map. On click of a route, wouldn’t it be perfect to see a little network of all the Pokemon to be found around here? This would be a great task for a next small stage of project development. 


### GitHub and project management
The pair of you worked compatibly together, and this is one of the project teams where it was clear each of you were contributing together throughout the course. Your repo is very well organized and this project was especially successful in following its schemas and supporting each other. You have also built a solid code base that you can easily revise and update. 

### Closing Comments
Congratulations on designing and developing a wonderful resource for Pokemon fans and curious outsiders alike! We hope you will continue to work on this site to repair some of the HTML validation problems, first of all, since that is very easy to fix. I could imagine you either wanting to add another Pokemon world or allowing another generation of coders to continue your work in a Pokemon2 site (kind of a sequel). Let me know what you are thinking and thanks for your wonderful work on this project this spring! The Pokemon files made terrific instruction examples in class and I think this project will be famously popular with coding students in future semesters. 
