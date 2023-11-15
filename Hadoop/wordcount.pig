--Load input file
inputFile = LOAD 'hdfs:///user/sadia/pigInput1.txt' AS (line);
--Tokenize each word
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
--Combine words
grpd = GROUP words BY word;
--count each word
cntd = FOREACH grpd GENERATE group, COUNT(words);
-- store results in HDFS
STORE cntd INTO 'hdfs:///user/sadia/pigResults';
