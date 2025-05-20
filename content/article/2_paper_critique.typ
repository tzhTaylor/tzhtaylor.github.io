#import "/typ/templates/blog.typ": *

#show: main.with(
  title: "Second Paper Critique",
  desc: "Orinoco: Ordered Issue and Unordered Commit with Non-Collapsible Queues",
  date: "2025-05-19",
)

#set align(left)

= Paper review

The paper addresses the need for more aggressive scheduling techniques in modern out-of-order processors to make use of increasing core resources. It introduces Orinoco, a microarchitecture/circuit co-design that supports ordered issue and unordered commit with non-collapsible queues. Orinoco decouples the temporal ordering of instructions from their queue positions by introducing an age matrix with bit count encoding, along with commit dependency and memory disambiguation matrices. These matrices are efficiently implemented using Processing-in-Memory (PIM) approach and 8T SRAM arrays.

The paper presents an evaluation of Orinoco using the gem5 simulator and SPEC CPU2017 benchmark suites. The results show that Orinoco achieves an average IPC improvement of 14.8% over the baseline in-order commit core with the state-of-the-art scheduler, while incurring overhead equivalent to a few kilobytes of SRAM.

Overall, the paper proposes a novel approach to scheduling in out-of-order processors and demonstrates its effectiveness through simulation-based evaluation.

= Strength of the paper

== Decoupling temporal ordering from queue structures

Orinoco introduces the age matrix with bit count encoding, which allows for the prioritization of instructions for issue or commit in constant time. This decoupling of temporal ordering from the instruction queue (IQ) or reorder buffer (ROB) positions enables further performance benefits of priority scheduling and out-of-order commit.

== Tracking commit conditions and memory dependencies

Orinoco proposes the commit dependency matrix and the memory disambiguation matrix to track the commit conditions and memory dependencies between instructions. This facilitates out-of-order commit with non-collapsible queues, improving performance.

== Leveraging Processing-in-Memory (PIM) approach

Orinoco leverages the PIM approach to implement matrix schedulers as 8T SRAMs. By customizing the bit cells and peripheral circuits, all the required operations can be performed inside the SRAM arrays in an all-digital manner. This approach provides higher density, better scalability, and comparable latency to the processor's clock speed.

== Performance improvements

Orinoco achieves an average improvement of 6.5% in instructions per cycle (IPC) with priority scheduling and 13.6% with out-of-order commit. The synergistic effect of these techniques leads to a 14.8% performance improvement compared to the baseline OoO core with age matrix encoding (AGE) and in-order commit. The area overhead is only 0.3%, and the power overhead is 0.6%, equivalent to a few kilobytes of SRAM.

= Weakness of the paper

The paper lacks a detailed analysis of the potential challenges and limitations that may arise during the implementation of the proposed Orinoco microarchitecture. While the paper briefly mentions that non-trivial modifications are required to support the bit count encoding and that careful layout design is needed to address transistor density issues, it does not provide a comprehensive discussion of these challenges and their potential impact on the overall performance and feasibility of the architecture. Additionally, the paper does not provide a thorough evaluation of the proposed architecture's scalability and applicability to real-world workloads. Further investigation and analysis of these limitations would enhance the credibility and practicality of the research.

= Conclusion

Compared with the in-order commit discussed in class, modern out-of-order processors need more active scheduling techniques, such as priority scheduling and out-of-order commit, in order to make full use of the increased core resources. Orinoco separates the time sequence of instructions from its queue position by introducing age matrix, commit dependency matrix and memory disambiguation matrix. At the same time, it also uses non-collapsible queues to solve the cost and performance problems of traditional collapsible queues. I have learned a lot of novel ideas from this paper, and I think it is worth recommending.
