# Runs the puzzle solver once with SWI-Prolog, prints the solution and exits.
FROM swipl:10.0.2
WORKDIR /app
COPY db.pl init.pl ./
CMD ["swipl", "init.pl"]
