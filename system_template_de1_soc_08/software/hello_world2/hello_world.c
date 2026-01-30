#include <stdlib.h>
#include <sys/alt_stdio.h>
#include <sys/alt_alarm.h>
#include <sys/times.h>
#include <alt_types.h>
#include <system.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>


#define DOUBLE_INNER 0x00
#define DOUBLE_INNER(A,B) __builtin_custom_fnff(DOUBLE_INNER,(A),(B));

#define FP_ADD 0x01
#define FP_ADD(A,B) __builtin_custom_fnff(FP_ADD,(A),(B));

// Test case 1
#define step 5
#define N 52

// Test case 2
//#define step 1/8.0
//#define N 2041

//Test case 3
//#define step 1/256.0
//#define N 65281

// Test Case 4
//#define N 2323
#define RANDSEED 334
#define MAXVAL 10000

void generateRandomVector(float x[N])
{
 int i;
 srand(RANDSEED);
 for (i=0; i<N; i++)
 {
 x[i] = ((float) rand()/ (float) RAND_MAX) * MAXVAL;
 }
}

// Generates the vector x and stores it in the memory
void generateVector(float x[N])
{
	int i;
	x[0] = 0;
	for (i=1; i<N; i++)
		x[i] = x[i-1] + step;
}
float sumVector(float x[], int N)
{
	// YOUR CODE GOES HERE
	float y;
	float two_sum;
	if (N % 2 != 0) {
        //y = INNER(x[N-1]);
		y = DOUBLE_INNER(x[N-1],0.0f);
    }
	int M = N/2
	for (i = 0; i < N - (N % 2); i += 2) {
		two_sum = DOUBLE_INNER(x[i],x[i + 1]);
		y = FP_ADD(y, two_sum);
	}
	return y;

}
int main()
	{
	 printf("Task 8!\n");
	 // Define input vector
	 float x[N];
	 // Returned result
	 float y;
	 generateVector(x);
	 // The following is used for timing
	 clock_t exec_t1, exec_t2;
	 exec_t1 = times(NULL); // get system time before starting the process

	 // The code that you want to time goes here
	 for (int i = 0; i < 10; i++) {
		 y = sumVector(x, N);
	 	}
	 //y = sumVector(x, N);
	 // till here
	 exec_t2 = times(NULL); // get system time after finishing the process

	 y = y/1024.0;
	 printf("Result: %d \n",(int) y);
	 printf("T1: %lu\n", exec_t1);
	 printf("T2: %lu\n", exec_t2);
	 printf("Time (in ?): %lu\n", exec_t2 - exec_t1);
	 return 0;
}
