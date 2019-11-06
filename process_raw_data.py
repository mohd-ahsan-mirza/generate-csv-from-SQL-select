import sys
def parse_file_into_array(file_object):
    result = []
    index = 0
    result.append("")
    for line in file_object:
        #print(line)
        if line.startswith("***************************"):
            result[index] = result[index].strip(",")
            index = index + 1
            result.append("")
        else:
            splitted_string = line.split(": ")
            # Any string that "," will be replaced with a space
            result[index] = result[index] + splitted_string[1].strip("\n\r").strip().replace(","," ") + ","
            if index == 1:
                result[0] = result[0] + splitted_string[0].strip("\n\r").strip() + ","
    result[len(result)-1] = result[len(result)-1].strip(",")
    result[0] = result[0].strip(",")
    return result
def generate_csv_file(result_array):
    with open("result.csv", "w") as output_file:
        for result in result_array:
            output_file.write("%s\n" % result)
if __name__ == '__main__':
    result_array = parse_file_into_array(open(sys.argv[1],"r"))
    #for result in result_array:
        #print(result)
    generate_csv_file(result_array)
