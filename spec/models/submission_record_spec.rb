# These rpec will test the validity of the SubmissionRecord model. It tests for
# valid team_id, operation, user, assignment id.
describe SubmissionRecord do
  let(:submission_record) { build(:submission_record, assignment_id: 1) }
  it 'is invalid without a team id' do
    expect(build(:submission_record, team_id: nil)).to_not be_valid
  end
  it 'is invalid without an operation' do
    expect(build(:submission_record, operation: nil)).to_not be_valid
  end
  it 'is invalid without a user' do
    expect(build(:submission_record, user: nil)).to_not be_valid
  end
  it 'is invalid without an assignment id' do
    expect(build(:submission_record, assignment_id: nil)).to_not be_valid
  end

  describe '#copy_submission_records_for_assignment' do
    it 'makes sure to save properly' do
      new_submission_record = submission_record.dup
      submission_record.update(:assignment_id => 2)
      expect(new_submission_record.save).to eq(true)
    end
  end
end
