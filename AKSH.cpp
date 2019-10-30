#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    cin>>n;
    int a[n];
    for(int i = 0; i < n; i++)
    {
        cin>>a[i];
    }
    int query;
    cin>>query;
    while(query--)
    {
        int seconds, nthElements,answer = -1;
        int firstElementIndex;
        cin>>seconds>>nthElements;
        int order = seconds%(n*2);
        int inAndout = order%n;
        if (order == inAndout)
        {
            firstElementIndex = order;
            if(n - firstElementIndex < nthElements){
            answer = -1;
            }
            else
            {
                answer = a[firstElementIndex + nthElements - 1];
            }

        }
        else
        {
            firstElementIndex = 0;
            if(inAndout < nthElements){
            answer = -1;
            }
            else
            {
                answer = a[firstElementIndex + nthElements - 1];
            }
        }
        cout<<answer<<endl;
    }

    return 0;
}
