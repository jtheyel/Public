
def ShouldIStay(Neighborcolors, p):
    
    # Find the number of times each color occurs
    numG = Neighborcolors.count("G")
    numR = Neighborcolors.count("R")
    
    # Calculate percentages of each color
    lenColor = len(Neighborcolors)
    percG = float(numG)/lenColor*100
    percR = float(numR)/lenColor*100

    # Compare to what we want
    if percR < p or percG < p:
        print "Get out of here"
    else:
        print "I'm happy"

Neighborcolors = [ "R", "R", "G", "R", "B", "R", "G", "B", "B", "G", "R", "G", "G"]
p = input("Enter a number between 0 and 100 for the percent: ")

#################
#      Run  
#################

ShouldIStay(Neighborcolors, p)
