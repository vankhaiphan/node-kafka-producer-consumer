import { Kafka } from 'kafkajs';
import { Chance } from 'chance';

const chance = new Chance();

const kafka = new Kafka({
	clientId: "my-producer",
	brokers: ["localhost:9092"],
});

const producer = kafka.producer();
const topic = 'animals';

const produceMessage = async () => {
	const value = chance.animal();

	try {
		await producer.send({
			topic,
			messages: [{ value }],
		});
	} catch (error) {
		console.error(error);
	}
};

const run = async () => {
	// Producing
	await producer.connect();
	setTimeout(produceMessage, 1000);
};

setInterval(() => {
	run().catch(console.error);
}, 3000);
