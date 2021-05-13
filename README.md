# leetcodesolver
Are you tired of grinding stupid LeetCode problems? Wish there was a better way?

Now there is with **leetcodesolver**, a bleeding edge API that solves leetcode problems for you.

Anyone can memorize an algorithm; why waste time re-inventing the wheel? Impress your interviewer by utilizing **leetcodesolver** today.

## Features
### Seamless Solve
Given an input, **leetcodesolver** returns the right output.

### Retroactive Analysis
In addition to the solution, **leetcodesolver** provides you with a detailed analysis of this problem's *historical call cadence* **(HCC)**, which reveals what questions are currently hot on the market. In addition to being highly useful, this feature is also a good excuse to practice MongoDB.

## Examples

### Reverse a String

`curl -X POST --data '{"original":"lmao"}' http://localhost:9292/reverse_string`

```bigquery
{
   "solution":{
      "solution":"oaml"
   },
   "problem_calls":{
      "_id":{
         "$oid":"609c6346b514a4a6d84a8d1b"
      },
      "problem_name":"reverse_string",
      "count":5,
      "last_called":"2021-05-13 10:37:01 -0700",
      "times":[
         "2021-05-12 16:22:46 -0700",
         "2021-05-12 16:23:25 -0700",
         "2021-05-13 09:26:31 -0700",
         "2021-05-13 10:34:57 -0700",
         "2021-05-13 10:37:01 -0700"
      ]
   }
}
```

### Two Sum
`curl -X POST --data '{"target":5,"list":[4,3,2]}' http://localhost:9292/two_sum`

```bigquery
{
   "solution":{
      "solution":[
         3,
         2
      ]
   },
   "problem_calls":{
      "_id":{
         "$oid":"609c62b1b514a4a6a1947124"
      },
      "problem_name":"two_sum",
      "count":8,
      "last_called":"2021-05-13 09:26:26 -0700",
      "times":[
         "2021-05-12 16:20:17 -0700",
         "2021-05-12 16:20:21 -0700",
         "2021-05-12 16:20:34 -0700",
         "2021-05-12 16:23:40 -0700",
         "2021-05-13 09:24:13 -0700",
         "2021-05-13 09:24:43 -0700",
         "2021-05-13 09:24:57 -0700",
         "2021-05-13 09:26:26 -0700"
      ]
   }
}
```

## Disclaimer
Currently, only `reverse_string` and `two_sum` are supported.

## Running Locally
1. Install Gems and shit, I didn't use the Gemfile correctly so don't rely on that
2. Run `rackup config.ru`

