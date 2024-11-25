import itertools


def tsp_brute_force(distances):
   n = len(distances)
   cities = range(n)
   min_path = None
   min_cost = float('inf')
  # Generate all possible permutations of cities
   for perm in itertools.permutations(cities):
       cost = 0
       for i in range(n - 1):
           cost += distances[perm[i]][perm[i + 1]]
       cost += distances[perm[-1]][perm[0]]  # Return to starting city
       if cost < min_cost:
           min_cost = cost
           min_path = perm
   return min_path, min_cost


if __name__ == "__main__":
   # Example distance matrix (4 cities)
   distances = [
       [0, 10, 15, 20],
       [10, 0, 35, 25],
       [15, 35, 0, 30],
       [20, 25, 30, 0]
   ]
   path, cost = tsp_brute_force(distances)
   print(f"Optimal path: {path}, Cost: {cost}")
