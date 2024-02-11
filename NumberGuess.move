address 0x1 {
module GuessingGame {
    use 0x1::AptosAccount;
    use 0x1::AptosRoll;
    use 0x1::Coin;
    use 0x1::Signer;

    // Function to start the game, accepting an investment from the player.
    // For simplicity, the actual handling of coins/tokens is abstracted away.
    public fun start_game(account: &signer, investment: u64) {
        // Abstract: Register the game session and handle the investment.
        // In a real scenario, you would track the player's investment and associate it with their game session.
    }

    // Generate a random number using the Aptos Roll module.
    // This function assumes there is a roll_dice function in the AptosRoll module, which might not match the real API.
    fun generate_random_number(account: &signer) -> u64 {
        AptosRoll::roll_dice(account, 100) // Example: Generate a number between 0-99
    }

    // Calculate the prize based on the difference between the guessed number and the actual number.
    public fun calculate_prize(user_guess: u64, actual_number: u64, investment: u64): u64 {
        let difference: u64;

        if (user_guess > actual_number) {
            difference = user_guess - actual_number;
        } else {
            difference = actual_number - user_guess;
        }

        if (difference == 0) {
            investment * 2
        } else if (difference <= 2) {
            investment * 3 / 2
        } else if (difference <= 5) {
            investment * 11 / 10
        } else if (difference <= 7) {
            investment * 9 / 10
        } else if (difference <= 10) {
            investment * 75 / 100
        } else if (difference <= 30) {
            investment * 20 / 100
        } else {
            0
        }
    }

    // Example game flow function - not fully implementable without more context on Aptos Roll and token handling.
    public fun play_game(account: &signer, user_guess: u64, investment: u64) {
        // 1. Start game and handle investment (abstracted away in this example)
        start_game(account, investment);

        // 2. Generate a random number
        let actual_number = generate_random_number(account);

        // 3. Calculate prize based on the guess
        let prize = calculate_prize(user_guess, actual_number, investment);

        // 4. Handle prize distribution (abstracted away)
        // This would involve transferring the calculated prize amount back to the player.
    }
}
}