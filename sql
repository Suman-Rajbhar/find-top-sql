## SQL Query for get Top Competitors :
// Laravel Query Builder
            DB::table('hackers')->select('hackers.hacker_id', 'hackers.name')
            ->join('submissions', 'submissions.hacker_id', '=', 'hackers.hacker_id')
            ->join('challenges', 'challenges.challenge_id', '=', 'submissions.challenge_id')
            ->join('dificulties', 'dificulties.difficulty_level', '=', 'challenges.difficulty_level')
            ->whereRaw('submissions.score = dificulties.score')
            ->groupBy('hackers.hacker_id')
            ->groupBy('hackers.name')
            ->havingRaw('COUNT(*) > 1')
            ->orderBy('hackers.hacker_id', 'DESC')
            ->get();
