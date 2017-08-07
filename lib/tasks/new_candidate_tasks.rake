desc 'call TalkPush API'
task call_talkpush_api: :environment do
	candidate = CandidatesController.new
	candidate.create
end